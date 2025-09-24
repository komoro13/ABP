# send-delta-gql.ps1  (PowerShell 7+)
$ErrorActionPreference = 'Stop'

# === PUT YOUR GRAPHQL PIECES HERE ===
# ---- GraphQL query ----
$query = @'
query ($offerSearchCriteria: OfferSearchCriteriaInput!) {
  gqlSearchOffers(offerSearchCriteria: $offerSearchCriteria) {
    offerResponseId
    gqlOffersSets {
      trips {
        tripId
        scheduledDepartureLocalTs
        scheduledArrivalLocalTs
        originAirportCode
        destinationAirportCode
        stopCnt
        flightSegment {
          aircraftTypeCode
          dayChange
          destinationAirportCode
          flightLeg {
            legId
            dayChange
            destinationAirportCode
            feeRestricted
            scheduledArrivalLocalTs
            scheduledDepartureLocalTs
            layover {
              destinationAirportCode
              layoverAirportCode
              layoverDuration { hourCnt minuteCnt }
              departureFlightNum
              equipmentChange
              originAirportCode
              scheduledArrivalLocalTs
              scheduledDepartureLocalTs
            }
            operatedByOwnerCarrier
            redEye
            operatingCarrier { carrierCode carrierName }
            marketingCarrier { carrierCode carrierName }
            earnLoyaltyMiles
            loyaltyMemberBenefits
            dominantLeg
            duration { dayCnt hourCnt minuteCnt }
            originAirport { airportTerminals { terminalId } }
            destinationAirport { airportTerminals { terminalId } }
            originAirportCode
            aircraft { fleetTypeCode subFleetTypeCode newSubFleetType }
            carrierCode
            distance { unitOfMeasure unitOfMeasureCnt }
          }
          layover {
            destinationAirportCode
            layoverAirportCode
            layoverDuration { hourCnt minuteCnt }
            departureFlightNum
            equipmentChange
            originAirportCode
            scheduledArrivalLocalTs
            scheduledDepartureLocalTs
          }
          marketingCarrier { carrierCode carrierNum }
          operatingCarrier { carrierCode carrierNum carrierName }
          pendingGovtApproval
          destinationCityCode
          flightSegmentNum
          originAirportCode
          originCityCode
          scheduledArrivalLocalTs
          scheduledDepartureLocalTs
          aircraft { fleetTypeCode subFleetTypeCode newSubFleetType }
        }
        totalTripTime { dayCnt hourCnt minuteCnt }
        summarizedProductId
      }
      additionalOfferSetProperties {
        globalUpgradeCertificateTripStatus { brandId upgradeAvailableStatusProductId }
        regionalUpgradeCertificateTripStatus { brandId upgradeAvailableStatusProductId }
        offerSetId
        seatReferenceId
        discountInfo { discountPct discountTypeCode nonDiscountedOffersAvailable }
        promotionsInfo { promotionalCode promotionalPct }
        discountInEligibilityList { code reason }
      }
      offerSetBadges { brandId }
      offers {
        offerId
        additionalOfferProperties {
          offered offerPriorityNum fareType dominantSegmentBrandId priorityNum soldOut
          unavailableForSale refundable
          offerBadges { brandId }
          payWithMilesEligible discountAvailable travelPolicyStatus secondarySolutionRefIds
        }
        soldOut
        offerItems {
          retailItems {
            retailItemMetaData {
              fareInformation {
                solutionId ticketDesignatorCode
                brandByFlightLegs {
                  brandId cosCode tripId
                  product { brandId typeCode }
                  globalUpgradeCertificateLegStatus { upgradeAvailableStatusProductId }
                  regionalUpgradeCertificateLegStatus { upgradeAvailableStatusProductId }
                  flightSegmentNum flightLegNum
                }
                discountInEligibilityList { code reason }
                availableSeatCnt
                farePrice {
                  discountsApplied {
                    pct code description reason
                    amount {
                      currencyEquivalentPrice { currencyAmt }
                      milesEquivalentPrice { mileCnt discountMileCnt }
                    }
                  }
                  totalFarePrice {
                    currencyEquivalentPrice { roundedCurrencyAmt formattedCurrencyAmt }
                    milesEquivalentPrice { mileCnt cashPlusMilesCnt cashPlusMiles }
                  }
                  originalTotalPrice {
                    currencyEquivalentPrice { roundedCurrencyAmt formattedCurrencyAmt }
                    milesEquivalentPrice { mileCnt cashPlusMilesCnt cashPlusMiles }
                  }
                  promotionalPrices {
                    price {
                      currencyEquivalentPrice { roundedCurrencyAmt formattedCurrencyAmt }
                      milesEquivalentPrice { mileCnt cashPlusMilesCnt cashPlusMiles }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    offerDataList {
      responseProperties {
        discountInfo { discountPct discountTypeCode nonDiscountedOffersAvailable }
        promotionsInfo { promotionalCode promotionalPct }
        discountInEligibilityList { code reason }
        resultsPerRequestNum pageResultCnt resultsPageNum
        sortOptionsList { sortableOptionDesc sortableOptionId }
        tripTypeText
      }
      offerPreferences {
        stopCnt destinationAirportCode
        connectionTimeRange { maximumNum minimumNum }
        originAirportCode
        flightDurationRange { maximumNum minimumNum }
        layoverAirportCode
        totalMilesRange { maximumNum minimumNum }
        totalPriceRange { maximumNum minimumNum }
      }
      retailItemDefinitionList { brandType retailItemBrandId refundable retailItemPriorityText }
      pricingOptions { pricingOptionDetail { currencyCode } }
    }
    gqlSelectedOfferSets {
      trips {
        tripId
        scheduledDepartureLocalTs
        scheduledArrivalLocalTs
        originAirportCode
        destinationAirportCode
        stopCnt
        flightSegment {
          destinationAirportCode
          marketingCarrier { carrierCode carrierNum }
          operatingCarrier { carrierCode carrierNum }
          flightSegmentNum
          originAirportCode
          scheduledArrivalLocalTs
          scheduledDepartureLocalTs
          aircraft { fleetTypeCode subFleetTypeCode newSubFleetType }
          flightLeg {
            destinationAirportCode feeRestricted
            layover {
              destinationAirportCode layoverAirportCode
              layoverDuration { hourCnt minuteCnt }
              departureFlightNum equipmentChange originAirportCode
              scheduledArrivalLocalTs scheduledDepartureLocalTs
            }
            operatedByOwnerCarrier redEye
            operatingCarrier { carrierCode carrierName }
            marketingCarrier { carrierCode carrierName }
            earnLoyaltyMiles loyaltyMemberBenefits dominantLeg
            duration { dayCnt hourCnt minuteCnt }
            originAirport { airportTerminals { terminalId } }
            destinationAirport { airportTerminals { terminalId } }
            originAirportCode
            aircraft { fleetTypeCode subFleetTypeCode newSubFleetType }
            carrierCode
            distance { unitOfMeasure unitOfMeasureCnt }
            scheduledArrivalLocalTs scheduledDepartureLocalTs dayChange legId
          }
        }
        totalTripTime { dayCnt hourCnt minuteCnt }
      }
      offers {
        additionalOfferProperties { dominantSegmentBrandId fareType }
        soldOut
        offerItems { retailItems { retailItemMetaData { fareInformation { brandByFlightLegs { tripId brandId cosCode } } } } }
      }
      additionalOfferSetProperties { seatReferenceId }
    }
  }
}
'@

# ---- Variables (PowerShell hashtable) ----
$variables = @{
  offerSearchCriteria = @{
    productGroups = @(@{ productCategoryCode = 'FLIGHTS' })
    offersCriteria = @{
      resultsPageNum       = 1
      resultsPerRequestNum = 20
      preferences = @{
        refundableOnly                         = $false
        showGlobalRegionalUpgradeCertificate   = $true
        nonStopOnly                            = $false
      }
      pricingCriteria = @{ priceableIn = @('CURRENCY') }
      flightRequestCriteria = @{
        currentTripIndexId  = '0'
        sortableOptionId    = $null
        selectedOfferId     = ''
        searchOriginDestination = @(
          @{
            departureLocalTs = '2025-10-14T00:00:00'
            destinations     = @(@{ airportCode = 'ATH' })
            origins          = @(@{ airportCode = 'JFK' })
          }
        )
        sortByBrandId = 'BE'
        additionalCriteriaMap = @{ rollOutTag = 'GBB' }
      }
    }
    customers = @(@{ passengerTypeCode = 'ADT'; passengerId = '1' })
  }
}


if (-not $query)     { throw "Query not set. Paste your `$query first." }
if (-not $variables) { throw "Variables not set. Paste your `$variables first." }

# === CONSTANTS ===
#$warmupUrl = 'https://www.delta.com/'
$gqlUrl    = 'https://offer-api-prd.delta.com/prd/rm-offer-gql'
$ua        = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36'

# Build body
$bodyJson = @{
  query     = $query
  variables = $variables
} | ConvertTo-Json -Depth 12

$gqlHeaders = @{
  "accept"="application/json, text/plain, */*"
  "accept-language"="en-GB,en;q=0.9,el-GR;q=0.8,el;q=0.7,en-US;q=0.6"
  "airline"="DL"
  "applicationid"="DC"
  "authorization"="GUEST"
  "cache-control"="no-cache"
  "channelid"="DCOM"
  "origin"="https://www.delta.com"
  "pragma"="no-cache"
  "priority"="u=1, i"
  "referer"="https://www.delta.com/"
  "sec-ch-ua"="`"Chromium`";v=`"140`", `"Not=A?Brand`";v=`"24`", `"Google Chrome`";v=`"140`""
  "sec-ch-ua-mobile"="?0"
  "user-agent"="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36"
  "sec-ch-ua-platform"="`"Windows`""
  "sec-fetch-dest"="empty"
  "sec-fetch-mode"="cors"
  "sec-fetch-site"="same-site"
  "transactionid"="1ad404b0-a993-4250-9e99-6a4be608bc8c_1758413366107"
  "x-app-type"="shop-mach"
  }

try {
  $resp = Invoke-WebRequest -Uri $gqlUrl
                            -Method POST
                            -Headers $gqlHeaders
                            -Body $bodyJson
                            -ContentType 'application/json'

  Write-Host "Status: $($resp.StatusCode)"
  Write-Host "Response-Body:"
  $resp.Content
}
catch {
  Write-Error "POST failed: $($_.Exception.Message)"
}